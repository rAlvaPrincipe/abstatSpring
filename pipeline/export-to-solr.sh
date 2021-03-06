#!/bin/bash

function as_absolute()
{
	echo `cd $1; pwd`
}

function run(){
	echo "$@"
	java -Xms256m -Xmx16g -cp .:'summarization.jar' it.unimib.disco.summarization.export.$@
	echo "Done"
}

set -e
relative_path=`dirname $0`
current_directory=$(as_absolute $relative_path)
cd $current_directory

echo
echo "Indexing the produced summary"

dataset=$1
payleveldomain=$2

cd ../summarization-spring

run DeleteAllDocumentsFromIndex $dataset

sleep 1
summary_dir="../data/summaries/$dataset/patterns/"
run RunResourcesIndexing ../data/summaries/$dataset/patterns/count-concepts.txt $dataset concept $payleveldomain
run RunResourcesIndexing ../data/summaries/$dataset/patterns/count-datatype.txt $dataset datatype $payleveldomain
run RunResourcesIndexing ../data/summaries/$dataset/patterns/count-datatype-properties.txt $dataset datatypeProperty $payleveldomain
run RunResourcesIndexing ../data/summaries/$dataset/patterns/count-object-properties.txt $dataset objectProperty $payleveldomain
run RunAKPIndexing ../data/summaries/$dataset/patterns/datatype-akp.txt $dataset datatypeAkp $payleveldomain $summary_dir
run RunAKPIndexing ../data/summaries/$dataset/patterns/object-akp.txt $dataset objectAkp $payleveldomain $summary_dir

cd ../pipeline
