import pandas as pd
df = pd.read_csv('/home/jacob/mibiogen37to38/only6ordered.csv.gz')
dfnew = df.drop_duplicates(subset=['variant_id'])
#removes extra snps from data to decrease size of table
dfnew.to_csv('/home/jacob/mibiogen37to38/only6nodupes.csv.gz', compression='gzip')
#csv recompressed to save size
