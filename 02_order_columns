import pandas as pd
df = pd.read_csv('/home/jacob/mibiogen37to38/only6.tsv.gz', usecols=['chromosome', 'base_pair_location','variant_id', 'other_allele', 'effect_allele','effect_allele_frequency'])
df2 = df.sort_values('variant_id')
#sorting based on snp orders column data for comparison
df2.to_csv('/home/jacob/mibiogen37to38/only6ordered.csv.gz', compression='gzip')
