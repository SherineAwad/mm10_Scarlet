from Bio import SeqIO

# Load your GenBank file
record = SeqIO.read("neurog2-9sa-p2a-mscarlet3_cw3sl.gb", "genbank")

# Extract Neurog2-9SA and mScarlet3 sequences
for feature in record.features:
    label = feature.qualifiers.get("label", [""])[0]
    if label in ["Neurog2-9SA", "mScarlet3"]:
        seq = feature.extract(record.seq)
        print(f">{label}\n{seq}\n")

