#!/usr/bin/env bash
BUCKET=oneconcern-pkgs
DATE=`date +%m%d%Y-%H%M%S`

cd $CIRCLE_PROJECT_REPONAME
debian/rules binary
cd ~
FILE=`ls python-oq-engine*`
echo "aws s3 cp $FILE s3://$BUCKET/python-oq-engine/$CIRCLE_BRANCH/"
aws s3 cp $FILE s3://$BUCKET/python-oq-engine/$CIRCLE_BRANCH/
echo "Updating latest zip for ${CIRCLE_BRANCH}"
aws s3 cp $FILE s3://$BUCKET/python-oq-engine/$CIRCLE_BRANCH/python-oq-engine-latest.deb
