#!/bin/bash

mkdir -p /github/home/.sbt/1.0/plugins/

# touch /github/home/.sbt/.credentials
# cat /dev/null > /github/home/.sbt/.credentials
# {
#   echo 'realm=Sonatype Nexus Repository Manager';
#   echo "host=oss.sonatype.org";
#   echo "user=$NEXUS_USER";
#   echo "password=$NEXUS_PASSWORD"
# } >> /github/home/.sbt/.credentials
# sha1sum /github/home/.sbt/.credentials

touch /github/home/.sbt/1.0/sonatype.sbt
cat /dev/null > /github/home/.sbt/1.0/sonatype.sbt
{
  echo 'credentials += Credentials("Sonatype Nexus Repository Manager",';
  echo '        "oss.sonatype.org",';
  echo '        "'"$NEXUS_USER"'",';
  echo '        "'"$NEXUS_PASSWORD"'")'
} >> /github/home/.sbt/1.0/sonatype.sbt
sha1sum /github/home/.sbt/1.0/sonatype.sbt

# touch /github/home/.sbt/1.0/global.sbt
# cat /dev/null > /github/home/.sbt/1.0/global.sbt
# {
#   echo 'credentials += Credentials("Sonatype Nexus Repository Manager",';
#   echo '        "oss.sonatype.org",';
#   echo '        "'"$NEXUS_USER"'",';
#   echo '        "'"$NEXUS_PASSWORD"'")'
# } >> /github/home/.sbt/1.0/global.sbt
# sha1sum /github/home/.sbt/1.0/global.sbt

touch /github/home/.private.key
cat /dev/null > /github/home/.private.key
echo -e "$GPG_PK" > /github/home/.private.key
gpg --import --batch /github/home/.private.key
rm -rf /github/home/.private.key

# touch /github/home/.sbt/1.0/plugins/plugins.sbt
# cat /dev/null > /github/home/.sbt/1.0/plugins/plugins.sbt
# {
#   echo 'addSbtPlugin("org.xerial.sbt" % "sbt-sonatype" % "2.3")'
# } >> /github/home/.sbt/1.0/plugins/plugins.sbt

# gpg --list-keys

sbt +publish