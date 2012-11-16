int RESOLUTION = 100000;
RandomList rl = new RandomList(RESOLUTION * 2, 12345);
PMatrix<Float> m = rl.groupBy(2);
PList<Float> pair = m.reduceLines(new LambdaReducer<Float>() {

	@Override
	public Float combine(Float input, Float other) {
		return ((Math.sqrt(Math.pow(input, 2) + Math.pow(other, 2)) <= 1)) ? 1f
				: 0f;
	}
});

Float f = pair.reduce(new LambdaReducerWithSeed<Float>() {
	@Override
	public Float combine(Float input, Float output) {
		return input + output;
	}

	@Override
	public Float getSeed() {
		return (float) 0;
	}
});

float pi = 4 * f / (float) RESOLUTION;
System.out.println("PI: " + pi);