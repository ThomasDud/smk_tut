rule plot_map_quality:
        '''
	Plotting the quality of bases
        '''
	input:
              	rules.alfred_TSV.output
        output:
               	config['output'] + '/qc/plots/mapqc/{sample}.map_qc.pdf'
        threads:
                1
        conda:
              	'../envs/plot.yaml'
        benchmark:
                'benchmarks/{sample}.plot_map_quality.benchmark.txt'
        resources:
                mem_mb=125,
                time='00:00:15'
        shell:
              	'''
                Rscript 'workflow/scripts/map_qc.R' {input} {output}
                '''
