cities  = ["Lisbon", "Paris", "Oslo"]

trips = [  (from_, to) for from_ in cities for to in cities if not to == from_  ]

# trips = filter(lambda x: x[0] != "Lisbon", trips)

for t in trips:
    print t