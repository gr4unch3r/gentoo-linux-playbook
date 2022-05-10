COLLECTIONS=requirements.yml
PLAYBOOK=main.yml

.PHONY: requirements install

requirements:
	ansible-galaxy collection install -r $(COLLECTIONS)

install:
	ansible-playbook $(PLAYBOOK)

default: requirements
