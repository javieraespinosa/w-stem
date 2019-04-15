
## Configuration

### Docker

[Docker][docker_wiki] is a platform for creating and running containerized apps. You have 2 options for running docker:

+ **[Docker Community Edition][docker_ce]**. Ideal for recent Mac and Windows 10 Pro systems.
	* [Install Docker CE for Mac][docker_4mac]
	* [Install Docker CE for Windows][docker_4win]
+ **[Docker Toolbox][docker_toolbox]**. For older Mac and Windows systems that do not meet the Docker CE requirements.
	* [Install Docker Toolbox on Windows][docker_tool4win]
	* [Install Docker Toolbox on macOS][docker_tool4mac]


If you encounter one of the following error messages:

* VT-x/AMD-V hardware acceleration is not available on your system
* This host supports Intel VT-x, but Intel VT-x is disabled
* The processor on this computer is not compatible with Hyper-V

Follow this [instructions][guide_vtx] for enabling virtualization in your machine. For any other problems [google is your friend](http://www.giyf.com).


### Forwarding ports  

**_Only for Docker Toolbox Users_**

The exercises require to forward ports to the **default** virtual machine. Open Virtual Box and fordward the following ports ([how to forward ports](https://www.howtogeek.com/122641/how-to-forward-ports-to-a-virtual-machine-and-use-it-as-a-server/)):
 
* 8888:8888
* 27017:27017 



## Running

This environment is composed of 2 docker images: `jupyter` and `mongodb`.

Start the docker containers as follows:

```
docker-compose up
```

The database is empty when starting docker for the first time. You can download the data from here:

[https://drive.google.com/open?id=1o1sbxsWnInSxMBfW3PQwcnskIGZWpOZi](https://drive.google.com/open?id=1o1sbxsWnInSxMBfW3PQwcnskIGZWpOZi)

Unzip the file (`orcid-summaries.json.zip`). Move the resulting file to `./work`:

```
mv orcid-summaries.json work/
```

Connect to the `mongodb` docker container:

```
docker exec -it <docker_container_id> /bin/bash
```

Change to the `work/` directory:

```
cd /home/jovyan/work
```

Import the data to the database:

```
mongoimport --db w-steam --collection orcid-summaries --file orcid-summaries.json
```



[mapbox_dev]: https://www.mapbox.com/developers/
[google_dev]: https://developers.google.com/maps
[mapbox_token]: https://www.mapbox.com/help/how-access-tokens-work/
[google_token]: https://developers.google.com/maps/documentation/javascript/get-api-key
[dxlab_ds]: https://github.com/javieraespinosa/dxlab-smart-cities-ds
[dxlab]: https://github.com/javieraespinosa/dxlab-smart-cities
[school]: http://eventos.ifrn.edu.br/frbrschool
[docker_ce]: https://www.docker.com/community-edition
[docker_toolbox]: https://www.docker.com/products/docker-toolbox
[docker_wiki]: https://en.wikipedia.org/wiki/Docker_(software)
[docker_tool4mac]: https://docs.docker.com/toolbox/toolbox_install_mac/
[docker_tool4win]: https://docs.docker.com/toolbox/toolbox_install_windows
[docker_4mac]: https://docs.docker.com/docker-for-mac/install
[docker_4win]: https://docs.docker.com/docker-for-windows/install

[image_rabbit]: https://hub.docker.com/_/rabbitmq/
[image_dxlab]: https://hub.docker.com/r/jaeo/dxlab-smart-cities/ 
[dxlab_deps]: https://hub.docker.com/r/jaeo/dxlab-smart-cities/~/dockerfile/

[guide_vtx]: https://www.howtogeek.com/213795/how-to-enable-intel-vt-x-in-your-computers-bios-or-uefi-firmware/
[board]: https://docs.google.com/document/d/1zjw73GByBPQwVrLfRCOxXVuiGTsIVnhD5CP37U1DF1A/edit?usp=sharing


