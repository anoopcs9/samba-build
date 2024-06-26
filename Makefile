refspec = master

prep.dirs:
	@ansible-playbook --inventory localhost, ./ansible/prep.dirs.yml

tarball:
	@ansible-playbook --inventory localhost, ./ansible/make.tarball.yml --extra-vars "refspec=$(refspec)"

srpm:
	@ansible-playbook --inventory localhost, ./ansible/build.srpm.yml --extra-vars "refspec=$(refspec)"


rpms.centos8:
	@ansible-playbook --inventory localhost, ./ansible/build.rpms.centos8.yml --extra-vars "refspec=$(refspec)"

test.rpms.centos8:
	@ansible-playbook --inventory localhost, ./ansible/test.rpms.centos8.yml --extra-vars "refspec=$(refspec)"

rpms.centos9:
	@ansible-playbook --inventory localhost, ./ansible/build.rpms.centos9.yml --extra-vars "refspec=$(refspec)"

test.rpms.centos9:
	@ansible-playbook --inventory localhost, ./ansible/test.rpms.centos9.yml --extra-vars "refspec=$(refspec)"


vers = 40

rpms.fedora:
	@ansible-playbook --inventory localhost, ./ansible/build.rpms.fedora.yml --extra-vars "version=$(vers) refspec=$(refspec)"

test.rpms.fedora:
	@ansible-playbook --inventory localhost, ./ansible/test.rpms.fedora.yml --extra-vars "version=$(vers) refspec=$(refspec)"
