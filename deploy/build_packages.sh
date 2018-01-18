#!/usr/bin/env bash
BUCKET=oneconcern-pkgs
DATE=`date +%m%d%Y-%H%M%S`

cd $CIRCLE_PROJECT_REPONAME
fakeroot debian/rules binary
cd ~
FILE=`ls python-oq-engine*`
echo "$FILE"
echo "aws s3 cp $FILE s3://$BUCKET/python-oq-engine/$CIRCLE_BRANCH/"
aws s3 cp $FILE s3://$BUCKET/python-oq-engine/$CIRCLE_BRANCH/
echo "Updating latest zip for ${CIRCLE_BRANCH}"
aws s3 cp $FILE s3://$BUCKET/python-oq-engine/$CIRCLE_BRANCH/python-oq-engine_latest.deb
