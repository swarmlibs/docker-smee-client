make:
	pnpm install --frozen-lockfile
	pnpm build
	docker buildx bake local --load
