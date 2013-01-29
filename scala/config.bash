export SCALA_HOME="/opt/scala"
export PLAY_HOME="/opt/play"

conditionally_prefix_path "${SCALA_HOME}/bin"
conditionally_prefix_path "${PLAY_HOME}"
