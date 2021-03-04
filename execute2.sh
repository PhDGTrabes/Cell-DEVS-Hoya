#!/bin/bash

FILENAME_SEQ=./results/${kind}_seq_W${W}_D${D}_INT${INTERNAL}_EXT${EXTERNAL}.csv
FILENAME_CPU_PARALLEL=./results/${kind}_cpu_parallel_W${W}_D${D}_INT${INTERNAL}_EXT${EXTERNAL}.csv
FILENAME_CPU_LAMBDA_PARALLEL=./results/${kind}_cpu_lambda_parallel_W${W}_D${D}_INT${INTERNAL}_EXT${EXTERNAL}.csv
FILENAME_CPU_DELTA_PARALLEL=./results/${kind}_cpu_delta_parallel_W${W}_D${D}_INT${INTERNAL}_EXT${EXTERNAL}.csv
ITERATIONS=10
PROCESSORS=8

echo "N=317"
RESULT=0
echo "SEQUENTIAL"

for i in `seq 1 $ITERATIONS`; do
    CURR=$(bin/hoya ./config/317.json 500)
    echo "PARTIAL:${CURR}"
    RESULT=$(echo "${RESULT}+${CURR}" | bc)
done

RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
echo "RESULT:${RESULT}"


echo "CPU_PARALLEL"


for THREADS in `seq 1 $PROCESSORS`; do
    RESULT=0
    echo "CPU_PARALLEL with ${THREADS} THREADS"
    for i in `seq 1 $ITERATIONS`; do
        CURR=$(bin/cpu_parallel_hoya ./config/317.json $THREADS 500)
        echo "PARTIAL:${CURR}"
        RESULT=$(echo "${RESULT}+${CURR}" | bc)
    done

        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
done



echo "CPU_LAMBDA_PARALLEL"


for THREADS in `seq 1 $PROCESSORS`; do
    RESULT=0
    echo "CPU_PARALLEL with ${THREADS} THREADS"
    for i in `seq 1 $ITERATIONS`; do
        CURR=$(bin/cpu_lambda_parallel_hoya ./config/317.json $THREADS 500)
        echo "PARTIAL:${CURR}"
        RESULT=$(echo "${RESULT}+${CURR}" | bc)
    done

        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
done


echo "CPU_DELTA_PARALLEL"


for THREADS in `seq 1 $PROCESSORS`; do
    RESULT=0
    echo "CPU_PARALLEL with ${THREADS} THREADS"
    for i in `seq 1 $ITERATIONS`; do
        CURR=$(bin/cpu_delta_parallel_hoya ./config/317.json $THREADS 500)
        echo "PARTIAL:${CURR}"
        RESULT=$(echo "${RESULT}+${CURR}" | bc)
    done

        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
done






echo "N=448"
RESULT=0
echo "SEQUENTIAL"

for i in `seq 1 $ITERATIONS`; do
    CURR=$(bin/hoya ./config/448.json 500)
    echo "PARTIAL:${CURR}"
    RESULT=$(echo "${RESULT}+${CURR}" | bc)
done

RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
echo "RESULT:${RESULT}"


echo "CPU_PARALLEL"


for THREADS in `seq 1 $PROCESSORS`; do
    RESULT=0
    echo "CPU_PARALLEL with ${THREADS} THREADS"
    for i in `seq 1 $ITERATIONS`; do
        CURR=$(bin/cpu_parallel_hoya ./config/448.json $THREADS 500)
        echo "PARTIAL:${CURR}"
        RESULT=$(echo "${RESULT}+${CURR}" | bc)
    done

        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
done



echo "CPU_LAMBDA_PARALLEL"


for THREADS in `seq 1 $PROCESSORS`; do
    RESULT=0
    echo "CPU_PARALLEL with ${THREADS} THREADS"
    for i in `seq 1 $ITERATIONS`; do
        CURR=$(bin/cpu_lambda_parallel_hoya ./config/448.json $THREADS 500)
        echo "PARTIAL:${CURR}"
        RESULT=$(echo "${RESULT}+${CURR}" | bc)
    done

        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
done


echo "CPU_DELTA_PARALLEL"


for THREADS in `seq 1 $PROCESSORS`; do
    RESULT=0
    echo "CPU_PARALLEL with ${THREADS} THREADS"
    for i in `seq 1 $ITERATIONS`; do
        CURR=$(bin/cpu_delta_parallel_hoya ./config/448.json $THREADS 500)
        echo "PARTIAL:${CURR}"
        RESULT=$(echo "${RESULT}+${CURR}" | bc)
    done

        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
done





























echo "CPU_PARALLEL"
bin/cpu_parallel_hoya ./config/100.json 2 500
bin/cpu_parallel_hoya ./config/100.json 4 500
bin/cpu_parallel_hoya ./config/100.json 8 500
echo "CPU_LAMBDA_PARALLEL"
bin/cpu_lambda_parallel_hoya ./config/100.json 2 500
bin/cpu_lambda_parallel_hoya ./config/100.json 4 500
bin/cpu_lambda_parallel_hoya ./config/100.json 8 500
echo "CPU_DELTA_PARALLEL"
bin/cpu_delta_parallel_hoya ./config/100.json 2 500
bin/cpu_delta_parallel_hoya ./config/100.json 4 500
bin/cpu_delta_parallel_hoya ./config/100.json 8 500

echo "N=112"
echo "SEQUENTIAL"
bin/hoya ./config/112.json 500
echo "CPU_PARALLEL"
bin/cpu_parallel_hoya ./config/112.json 8 500
echo "CPU_LAMBDA_PARALLEL"
bin/cpu_lambda_parallel_hoya ./config/112.json 8 500
echo "CPU_DELTA_PARALLEL"
bin/cpu_delta_parallel_hoya ./config/112.json 8 500


echo "N=354"
echo "SEQUENTIAL"
bin/hoya ./config/354.json 500
echo "CPU_PARALLEL"
bin/cpu_parallel_hoya ./config/354.json 8 500
echo "CPU_LAMBDA_PARALLEL"
bin/cpu_lambda_parallel_hoya ./config/354.json 8 500
echo "CPU_DELTA_PARALLEL"
bin/cpu_delta_parallel_hoya ./config/354.json 8 500



#./parallel_hoya ../config/354.json 2 500
#./parallel_hoya ../config/354.json 4 500

#./parallel_hoya ../config/613.json 2 500
#./parallel_hoya ../config/613.json 4 500

#./parallel_hoya ../config/707.json 2 500
#./parallel_hoya ../config/707.json 4 500

#./parallel_hoya ../config/866.json 2 500
#./parallel_hoya ../config/866.json 4 500

#./parallel_hoya ../config/935.json 2 500
#./parallel_hoya ../config/935.json 4 500

#./parallel_hoya ../config/1000.json 2 500
#./parallel_hoya ../config/1000.json 4 500
