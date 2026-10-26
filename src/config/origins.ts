export const origines = (process.env.TRUSTED_ORIGINS ?? 'http://localhost:5173')
	.split(',')
	.map((origine) => origine.trim())
	.filter(Boolean);