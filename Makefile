.PHONY: lint link-check parity-check check new-mindset

lint:
	npx markdownlint-cli2 "**/*.md"

link-check:
	@while IFS= read -r -d '' file; do \
		echo "Checking $$file"; \
		npx -y markdown-link-check "$$file" -q; \
	done < <(find . -type f -name "*.md" -not -path "./.git/*" -print0)

parity-check:
	bash scripts/check-parity.sh

check: lint parity-check

# Usage: make new-mindset NAME=knuth CATEGORY=strategy
new-mindset:
ifndef NAME
	$(error NAME is required. Usage: make new-mindset NAME=knuth CATEGORY=strategy)
endif
ifndef CATEGORY
	$(error CATEGORY is required. Usage: make new-mindset NAME=knuth CATEGORY=strategy)
endif
	@bash scripts/new-mindset.sh "$(NAME)" "$(CATEGORY)"
