
rule sam_sort_index:
        '''
	Sort the sam and index it
        '''
	input:
              	rules.bwa_align.output
        output:
               	config['output'] + '/bam/{sample}.bam'
        threads:
                2
        conda:
              	'../envs/samtools.yaml'
        benchmark:
                'benchmarks/{sample}.sam_sort_index.benchmark.txt'
        resources:
                mem_mb=35,
                time="00:00:05"
        container:
                'docker://biocontainers/samtools:v1.9-4-deb_cv1'
        shell:
              	'''
                samtools sort -@{threads} -o {output} --write-index {input}
                '''
