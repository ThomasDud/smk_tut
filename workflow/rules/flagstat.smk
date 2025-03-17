rule flagstat:
	'''
	Flagstat TSV
        '''
	input:
              	rules.sam_sort_index.output
        output:
               	config['output'] + '/qc/tsv/flagstats/{sample}.stats.tsv',
        threads:
                1
        conda:
              	'../envs/samtools.yaml'
        benchmark:
                'benchmarks/{sample}.flagstat.benchmark.txt'
        resources:
                mem_mb=40,
                time='00:00:05'
        shell:
              	'''
                samtools flagstat {input} -O tsv > {output}
                '''
