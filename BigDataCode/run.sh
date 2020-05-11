#!/usr/bin/env bash

HADOOP_CMD="/opt/module/hadoop-2.7.2/bin/hadoop"
STREAM_JAR_PATH="/opt/module/hadoop-2.7.2/share/hadoop/tools/lib/hadoop-streaming-2.7.2.jar"

INPUT_FILE_PATH_1="/user/bigdata/code/01_case/The_Man_of_Property.txt"
OUTPUT_PATH="/user/bigdata/code/01_case/output"

# 如果存在，删除
$HADOOP_CMD fs -rmr -skipTrash $OUTPUT_PATH

# Step 1.
$HADOOP_CMD jar $STREAM_JAR_PATH \
                -input $INPUT_FILE_PATH_1 \
                -output $OUTPUT_PATH \
                -mapper "python map.py" \
                -reducer "python red.py" \
                -file ./map.py \
                -file ./red.py