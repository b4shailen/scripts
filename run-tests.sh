#!/bin/bash

clear

SCRIPTS_ROOT=`pwd`
TESTS_ROOT=$SCRIPTS_ROOT/tests
#GROOVY='groovy -Dgroovy.grape.report.downloads=true'
GROOVY='groovy'

echo "--------------------------------------------------------------"
echo "SCRIPTS_ROOT = [$SCRIPTS_ROOT]"
echo "TESTS_ROOT   = [$TESTS_ROOT]"
echo "GROOVY       = [$GROOVY]"
echo "--------------------------------------------------------------"

echo --== Removing old files ==--
rm -rf $TESTS_ROOT && mkdir $TESTS_ROOT && cd $TESTS_ROOT

echo --== Getting projects ==--
echo --== Getting [wiki] ==--
wget --no-check-certificate -q -O wiki.zip http://github.com/evgeny-goldin/wiki/zipball/master && unzip -q wiki.zip && rm wiki.zip && mv evgeny-goldin-wiki-* wiki
# http://twitter.com/#!/evgeny_goldin/status/140897437110910976
# git clone  git://github.com/evgeny-goldin/wiki.git    $TESTS_ROOT/wiki
echo --== Getting [gmaps4jsf] ==--
svn checkout -q http://gmaps4jsf.googlecode.com/svn/trunk/ $TESTS_ROOT/checkout/gmaps4jsf

cd $SCRIPTS_ROOT/src/main/groovy

echo --== Running [links.groovy] ==--
$GROOVY mediawiki/links.groovy $TESTS_ROOT/wiki "**/*.txt"

echo --== Running [spaces.groovy] ==--
$GROOVY mediawiki/spaces.groovy $TESTS_ROOT/wiki "**/*.txt" true

echo --== Running [mvnOp.groovy] ==--
$GROOVY mvnOp.groovy $TESTS_ROOT

echo --== Running [svnOp.groovy] ==--
$GROOVY svnOp.groovy $TESTS_ROOT

cd $SCRIPTS_ROOT/src/test/groovy/mediawiki

echo --== Running [y2m.groovy] ==--
$GROOVY y2m.groovy

echo --== Removing old files ==--
rm -rf $TESTS_ROOT
