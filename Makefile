IMAGE_NAME = abnttex2
FILE = main
PWD = $(shell pwd)

OPEN_CMD = xdg-open
ifeq ($(shell uname), Darwin)
	OPEN_CMD = open
else ifneq (,$(findstring Microsoft,$(shell uname -r)))
	OPEN_CMD = cmd.exe /c start
endif

.PHONY: all build run clean help

all: run

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run --rm -v "$(PWD)":/build --name $(IMAGE_NAME)_container $(IMAGE_NAME) \
	sh -c "latexmk -pdf -outdir=build $(FILE).tex && mv build/$(FILE).pdf ."

view:
	@if [ -f "$(FILE).pdf" ]; then \
		$(OPEN_CMD) $(FILE).pdf; \
	else \
		echo "Error: $(FILE).pdf not found. Run 'make' first."; \
	fi

clean:
	rm -rf build/
	rm -f $(FILE).pdf
	@echo "Output files removed."

help:
	@echo "Available commands:"
	@echo "  make              - Compiles the PDF (default: main.tex)"
	@echo "  make FILE=name    - Compiles a specific file"
	@echo "  make view         - Opens the generated PDF"
	@echo "  make view FILE=x  - Opens a specific PDF (e.g., x.pdf)"
	@echo "  make clean        - Removes build folder and PDF"
	@echo "  make build        - Builds the Docker image"
