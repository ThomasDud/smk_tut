rule alfred_TSV:
        '''
	Creating the alfred tsv table
        '''
	input:
              	genome=config['genome'],
                bam=rules.sam_sort_index.output
        output:
               	config['output']+'/qc/tsv/{sample}.tsv.gz'
        threads:
                1
        conda:
              	'../envs/alfred.yaml'
        benchmark:
                'benchmarks/{sample}.alfred.benchmark.txt'
        resources:
                mem_mb=40,
                time='00:00:40'
        container:
                'docker://quay.io/biocontainers/alfred:0.1.3--h278814d_4'
        shell:
              	'''
                alfred qc -r {input.genome} -o {output} {input.bam}
