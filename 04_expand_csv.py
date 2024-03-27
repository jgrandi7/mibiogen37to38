#uncompresses no duplicate csv into full csv

import gzip

with gzip.open('/home/jacob/mibiogen37to38/only6nodupes.csv.gz', 'rb') as f:
    content = f.read()

with open('/home/jacob/mibiogen37to38/mibiogensnps37wfreq.csv', 'wb') as f:
    f.write(content)

