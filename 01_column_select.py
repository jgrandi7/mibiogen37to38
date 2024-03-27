import pandas as pd
#select columns used for liftover and needed for future analysis
df = pd.read_csv('/home/jacob/mibiogen37to38/final.gz', usecols=['chromosome', 'base_pair_location','variant_id', 'other_allele', 'effect_allele', 'effect_allele_frequency'], sep='\t')
df.to_csv('/home/jacob/mibiogen37to38/only6.tsv.gz', compression='gzip', index_col = False)
