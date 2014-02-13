mydocker
========

My Docker Image Settings

References
----------

* dockerfile ref: http://docs.docker.io/en/latest/use/builder/
* command usage ref: http://docs.docker.io/en/latest/commandline/cli/
* http://docs.docker.io/en/latest/use/port_redirection/#port-redirection

Install web GUI for docker
--------------------------

	edit /usr/lib/systemd/system/docker.service
	  /usr/bin/docker -d -H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock
	systemctl daemon-reload
	systemctl restart docker

	docker pull shipyard/shipyard
	docker run -i -t -d -p localhost:8080:80 -p localhost:8000:8000 ehazlett/shipyard
	# user/pass : admin/shipyard
