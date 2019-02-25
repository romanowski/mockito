for COMMIT in `git log --format=%H --merges -2 --reverse`
do
  echo Checking commit $COMMIT && \
  git checkout $COMMIT && \
  echo "" >> build.gradle && \
  echo apply from\: \'contextBuddy.gradle\' >> build.gradle && \
  git log -1 && \
  ./gradlew generateContextBuddy && \
  git checkout build.gradle || exit 1
done
