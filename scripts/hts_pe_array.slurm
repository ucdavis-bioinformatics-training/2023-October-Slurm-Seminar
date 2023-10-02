#!/bin/bash

#SBATCH --array=1-22  # NEED TO CHANGE THIS!
#SBATCH --job-name=htstream # Job name
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --time=2-0
#SBATCH --mem=20000 # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH --partition=production


start=`date +%s`
hostname
outdir="01-Cleaned"

sampfile="newids.sample_data.txt"
SAMPLE=`head -n ${SLURM_ARRAY_TASK_ID} $sampfile | tail -1 | cut -f1`
R1=`head -n ${SLURM_ARRAY_TASK_ID} $sampfile | tail -1 | cut -f2`
R2=`head -n ${SLURM_ARRAY_TASK_ID} $sampfile | tail -1 | cut -f3`

echo $SAMPLE

if [ ! -e $outdir ]; then
    mkdir $outdir
fi

if [ ! -e "$outdir/$SAMPLE" ]; then
    mkdir $outdir/$SAMPLE
fi

module load htstream/1.3.3
call="hts_Stats -F -L $outdir/$SAMPLE/$SAMPLE.stats.log -1 $R1 -2 $R2 | \
      hts_SeqScreener -F -A $outdir/$SAMPLE/$SAMPLE.stats.log | \
      hts_AdapterTrimmer -F -A $outdir/$SAMPLE/$SAMPLE.stats.log | \
      hts_Overlapper -F -A $outdir/$SAMPLE/$SAMPLE.stats.log | \
      hts_QWindowTrim -F -A $outdir/$SAMPLE/$SAMPLE.stats.log | \
      hts_LengthFilter -F -m 50 -A $outdir/$SAMPLE/$SAMPLE.stats.log | \
      hts_Stats -F -f $outdir/$SAMPLE/$SAMPLE.cleaned -A $outdir/$SAMPLE/$SAMPLE.stats.log"

echo $call
eval $call

end=`date +%s`
runtime=$((end-start))
echo Runtime: $runtime seconds

