export JAVA6_HOME=/site/jdk/jdk1.6.0_37/
export JAVA7_HOME=/site/jdk/jdk1.7.0_09/
export IDEA_JDK=${JAVA7_HOME}

setjdk jdk1.7.0_09 &>> /dev/null

conditionally_prefix_path "${JAVA_HOME}bin"
