# Project Documentation

Notes from my experience with hello app exercise.

## docker-buildkite-plugin issues

- docker#v5.12.0 doesn't seem to work on OSX. Error message: "docker: Error response from daemon: error while creating mount source path ..."
  I wrestled with it for quite a while thinking it was a configuration or permissions issue before
  I found the open issue on [github](https://github.com/buildkite-plugins/docker-buildkite-plugin/issues/282). I reverted to docker#v5.11.0 which got my first build step (uploading the artifact) running.

- After many tests, I decided to remove the docker plugin from the pipeline due a what I believe is another compatibility issue with OSX.
  - Running the first step in docker container worked with v5.11.0 but the final execution step would fail with error message: "cannot execute binary file". This execution was running on local machine instead of docker container but comparing architectures and checking file permissions, I could not find a standout issue that would prevent execution.
  - I ran the execution step in a docker container in an interactive session and the file executed without issue. But when I added the docker plugin with golang image to the pipeline, it resulted in error message: "Exec format error". Maybe another mount or path problem.
