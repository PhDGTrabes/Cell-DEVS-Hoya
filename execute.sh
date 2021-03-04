#!/bin/bash

FILENAME_SEQ=./results/${kind}_seq_W${W}_D${D}_INT${INTERNAL}_EXT${EXTERNAL}.csv
FILENAME_CPU_PARALLEL=./results/${kind}_cpu_parallel_W${W}_D${D}_INT${INTERNAL}_EXT${EXTERNAL}.csv
FILENAME_CPU_LAMBDA_PARALLEL=./results/${kind}_cpu_lambda_parallel_W${W}_D${D}_INT${INTERNAL}_EXT${EXTERNAL}.csv
FILENAME_CPU_DELTA_PARALLEL=./results/${kind}_cpu_delta_parallel_W${W}_D${D}_INT${INTERNAL}_EXT${EXTERNAL}.csv
ITERATIONS=1
PROCESSORS=8
TIME=5


echo "N=100"
RESULT=0
echo "SEQUENTIAL"

for i in `seq 1 $ITERATIONS`; do
    CURR=$(bin/hoya ./config/100.json $TIME)
    echo "PARTIAL:${CURR}"
    RESULT=$(echo "${RESULT}+${CURR}" | bc)
done

RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
echo "RESULT:${RESULT}"


echo "CPU_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
for THREADS in 2 4 8; do
    RESULT=0
    echo "CPU_PARALLEL with ${THREADS} THREADS"
    for i in `seq 1 $ITERATIONS`; do
        CURR=$(bin/cpu_parallel_hoya ./config/100.json $TIME $THREADS)
        echo "PARTIAL:${CURR}"
        RESULT=$(echo "${RESULT}+${CURR}" | bc)
    done

    RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
done



#echo "CPU_LAMBDA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_lambda_parallel_hoya ./config/317.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done


#echo "CPU_DELTA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_delta_parallel_hoya ./config/317.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done






echo "N=142"
RESULT=0
echo "SEQUENTIAL"

for i in `seq 1 $ITERATIONS`; do
    CURR=$(bin/hoya ./config/142.json $TIME)
    echo "PARTIAL:${CURR}"
    RESULT=$(echo "${RESULT}+${CURR}" | bc)
done

RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
echo "RESULT:${RESULT}"


echo "CPU_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
for THREADS in 2 4 8; do
    RESULT=0
    echo "CPU_PARALLEL with ${THREADS} THREADS"
    for i in `seq 1 $ITERATIONS`; do
        CURR=$(bin/cpu_parallel_hoya ./config/142.json $TIME $THREADS)
        echo "PARTIAL:${CURR}"
        RESULT=$(echo "${RESULT}+${CURR}" | bc)
    done

        #RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
    #echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
done



#echo "CPU_LAMBDA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_lambda_parallel_hoya ./config/448.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done


#echo "CPU_DELTA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_delta_parallel_hoya ./config/448.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done







echo "N=174"
RESULT=0
echo "SEQUENTIAL"

for i in `seq 1 $ITERATIONS`; do
    CURR=$(bin/hoya ./config/174.json $TIME)
    echo "PARTIAL:${CURR}"
    RESULT=$(echo "${RESULT}+${CURR}" | bc)
done

RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
echo "RESULT:${RESULT}"


echo "CPU_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
for THREADS in 2 4 8; do
    RESULT=0
    echo "CPU_PARALLEL with ${THREADS} THREADS"
    for i in `seq 1 $ITERATIONS`; do
        CURR=$(bin/cpu_parallel_hoya ./config/174.json $TIME $THREADS)
        echo "PARTIAL:${CURR}"
        RESULT=$(echo "${RESULT}+${CURR}" | bc)
    done

    RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
done



#echo "CPU_LAMBDA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_lambda_parallel_hoya ./config/548.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done


#echo "CPU_DELTA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_delta_parallel_hoya ./config/548.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done









echo "N=200"
RESULT=0
echo "SEQUENTIAL"

for i in `seq 1 $ITERATIONS`; do
    CURR=$(bin/hoya ./config/200.json $TIME)
    echo "PARTIAL:${CURR}"
    RESULT=$(echo "${RESULT}+${CURR}" | bc)
done

RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
echo "RESULT:${RESULT}"


echo "CPU_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
for THREADS in 2 4 8; do
    RESULT=0
    echo "CPU_PARALLEL with ${THREADS} THREADS"
    for i in `seq 1 $ITERATIONS`; do
        CURR=$(bin/cpu_parallel_hoya ./config/200.json $TIME $THREADS)
        echo "PARTIAL:${CURR}"
        RESULT=$(echo "${RESULT}+${CURR}" | bc)
    done

    RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
done



#echo "CPU_LAMBDA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_lambda_parallel_hoya ./config/632.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done


#echo "CPU_DELTA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_delta_parallel_hoya ./config/632.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done




echo "N=224"
RESULT=0
echo "SEQUENTIAL"

for i in `seq 1 $ITERATIONS`; do
    CURR=$(bin/hoya ./config/224.json $TIME)
    echo "PARTIAL:${CURR}"
    RESULT=$(echo "${RESULT}+${CURR}" | bc)
done

RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
echo "RESULT:${RESULT}"


echo "CPU_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
for THREADS in 2 4 8; do
    RESULT=0
    echo "CPU_PARALLEL with ${THREADS} THREADS"
    for i in `seq 1 $ITERATIONS`; do
        CURR=$(bin/cpu_parallel_hoya ./config/224.json $TIME $THREADS)
        echo "PARTIAL:${CURR}"
        RESULT=$(echo "${RESULT}+${CURR}" | bc)
    done

    RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
done



#echo "CPU_LAMBDA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_lambda_parallel_hoya ./config/708.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
#    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done


#echo "CPU_DELTA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_delta_parallel_hoya ./config/708.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done





echo "N=245"
RESULT=0
echo "SEQUENTIAL"

for i in `seq 1 $ITERATIONS`; do
    CURR=$(bin/hoya ./config/245.json $TIME)
    echo "PARTIAL:${CURR}"
    RESULT=$(echo "${RESULT}+${CURR}" | bc)
done

RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
echo "RESULT:${RESULT}"


echo "CPU_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
for THREADS in 2 4 8; do
    RESULT=0
    echo "CPU_PARALLEL with ${THREADS} THREADS"
    for i in `seq 1 $ITERATIONS`; do
        CURR=$(bin/cpu_parallel_hoya ./config/245.json $TIME $THREADS)
        echo "PARTIAL:${CURR}"
        RESULT=$(echo "${RESULT}+${CURR}" | bc)
    done

    RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
done



#echo "CPU_LAMBDA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_lambda_parallel_hoya ./config/775.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done


#echo "CPU_DELTA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_delta_parallel_hoya ./config/775.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done



echo "N=265"
RESULT=0
echo "SEQUENTIAL"

for i in `seq 1 $ITERATIONS`; do
    CURR=$(bin/hoya ./config/265.json $TIME)
    echo "PARTIAL:${CURR}"
    RESULT=$(echo "${RESULT}+${CURR}" | bc)
done

RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
echo "RESULT:${RESULT}"


echo "CPU_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
for THREADS in 2 4 8; do
    RESULT=0
    echo "CPU_PARALLEL with ${THREADS} THREADS"
    for i in `seq 1 $ITERATIONS`; do
        CURR=$(bin/cpu_parallel_hoya ./config/265.json $TIME $THREADS)
        echo "PARTIAL:${CURR}"
        RESULT=$(echo "${RESULT}+${CURR}" | bc)
    done

    RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
done



#echo "CPU_LAMBDA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_lambda_parallel_hoya ./config/837.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done


#echo "CPU_DELTA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_delta_parallel_hoya ./config/837.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done





echo "N=283"
RESULT=0
echo "SEQUENTIAL"

for i in `seq 1 $ITERATIONS`; do
    CURR=$(bin/hoya ./config/283.json $TIME)
    echo "PARTIAL:${CURR}"
    RESULT=$(echo "${RESULT}+${CURR}" | bc)
done

RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
echo "RESULT:${RESULT}"


echo "CPU_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
for THREADS in 2 4 8; do
    RESULT=0
    echo "CPU_PARALLEL with ${THREADS} THREADS"
    for i in `seq 1 $ITERATIONS`; do
        CURR=$(bin/cpu_parallel_hoya ./config/283.json $TIME $THREADS)
        echo "PARTIAL:${CURR}"
        RESULT=$(echo "${RESULT}+${CURR}" | bc)
    done

    RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
done



#echo "CPU_LAMBDA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_lambda_parallel_hoya ./config/895.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done


#echo "CPU_DELTA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_delta_parallel_hoya ./config/895.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done




echo "N=300"
RESULT=0
echo "SEQUENTIAL"

for i in `seq 1 $ITERATIONS`; do
    CURR=$(bin/hoya ./config/300.json $TIME)
    echo "PARTIAL:${CURR}"
    RESULT=$(echo "${RESULT}+${CURR}" | bc)
done

RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
echo "RESULT:${RESULT}"


echo "CPU_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
for THREADS in 2 4 8; do
    RESULT=0
    echo "CPU_PARALLEL with ${THREADS} THREADS"
    for i in `seq 1 $ITERATIONS`; do
        CURR=$(bin/cpu_parallel_hoya ./config/300.json $TIME $THREADS)
        echo "PARTIAL:${CURR}"
        RESULT=$(echo "${RESULT}+${CURR}" | bc)
    done

    RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
done



#echo "CPU_LAMBDA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_lambda_parallel_hoya ./config/949.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done


#echo "CPU_DELTA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_delta_parallel_hoya ./config/949.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done





echo "N=317"
RESULT=0
echo "SEQUENTIAL"

for i in `seq 1 $ITERATIONS`; do
    CURR=$(bin/hoya ./config/317.json $TIME)
    echo "PARTIAL:${CURR}"
    RESULT=$(echo "${RESULT}+${CURR}" | bc)
done

RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
echo "RESULT:${RESULT}"


echo "CPU_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
for THREADS in 2 4 8; do
    RESULT=0
    echo "CPU_PARALLEL with ${THREADS} THREADS"
    for i in `seq 1 $ITERATIONS`; do
        CURR=$(bin/cpu_parallel_hoya ./config/317.json $TIME $THREADS)
        echo "PARTIAL:${CURR}"
        RESULT=$(echo "${RESULT}+${CURR}" | bc)
    done

    RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
done



#echo "CPU_LAMBDA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_lambda_parallel_hoya ./config/1000.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done


#echo "CPU_DELTA_PARALLEL"


#for THREADS in `seq 1 $PROCESSORS`; do
#for THREADS in 1 2 4 8 16; do
#    RESULT=0
#    echo "CPU_PARALLEL with ${THREADS} THREADS"
#    for i in `seq 1 $ITERATIONS`; do
#        CURR=$(bin/cpu_delta_parallel_hoya ./config/1000.json $THREADS 500)
#        echo "PARTIAL:${CURR}"
#        RESULT=$(echo "${RESULT}+${CURR}" | bc)
#    done

#        RESULT=$(echo "scale=4; ${RESULT}/${ITERATIONS}" | bc)
#    echo "RESULT:${RESULT}"
    #echo "${THREADS},${RESULT}" >> "$FILENAME_CPU_PARALLEL"
#done

