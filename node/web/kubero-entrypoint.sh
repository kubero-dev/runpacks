#! /bin/sh
CMD=$(cat Procfile | grep $PROC_TYPE | awk -F  ": " '{print $2}')
eval $CMD