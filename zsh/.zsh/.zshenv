PATH="$PATH:/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:/bin:/usr/bin"

for path_candidate in /opt/godot-bin \
  /opt/google/chrome \
  ~/.yarn/bin

do
  if [ -d ${path_candidate} ]; then
    export PATH="${PATH}:${path_candidate}"
  fi
done
