rule plot_flagstat:
        '''
	Plotting the values of the flagstat
        '''
	input:
              	rules.flagstat.output
        output:
               	config['output'] + "/qc/plots/flagstats/{sample}.stats.pdf"
        threads:
                1
        conda:
              	'../envs/plot.yaml'
        benchmark:
                'benchmarks/{sample}.plot_flagstat.benchmark.txt'
        resources:
                mem_mb=130,
                time='00:00:15'
        shell:
              	'''
                Rscript workflow/scripts/bam_stats_plot.R {input} {output}
                '''
