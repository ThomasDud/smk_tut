rule bwa_align:
        '''
	Align
	'''
	input:
              	genome=config['genome'],
                fastq=lambda wildcards: glob(config['input'] +'/{sample}.fastq'.format(sample=wildcards.sample))
        output:
               	config['output'] + '/sam/{sample}.sam'
        threads:
                2
        conda:
              	'../envs/bwa.yaml'
        benchmark:
                'benchmarks/{sample}.bwa_align.benchmark.txt'
        params:
               	RG='"@RG\\tID:{sample}_1\\tSM:{sample}\\tPL:ILLUMINA"'
        resources:
                mem_mb=40,
                time='00:00:10'
        container:
                'docker://biocontainers/bwa:v0.7.17_cv1'
        shell:
              	'''
                bwa mem -R {params.RG} -t {threads} {input.genome} {input.fastq} > {output}
                '''
