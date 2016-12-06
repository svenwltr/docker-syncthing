node {
	def latest
 
	stage('prepare') {
		deleteDir()
		git credentialsId: 'github', url: 'git@github.com:svenwltr/docker-syncthing.git'
	}
 
	stage('check version') {
		latest = githubLatest('syncthing/syncthing')
		echo("Fetching latest syncthing version is $latest")
	}
 
	if (sh(script: 'git rev-parse ' + latest, returnStatus: true) == 0) {
		echo('Tag already exists. Exiting.')
		return
	}
 
	stage('bump version') {
		sh("""sed -i.bak \
			"s/^ARG SYNCTHING_VERSION=.*\$/ARG SYNCTHING_VERSION=${latest}/g" \
			Dockerfile""")

		sshagent(['github']) {
			sh('git add .')
			sh("git commit -m 'update ${latest}'")
			sh("git tag -m 'syncthing ${latest}' ${latest}")
		}
	}

	stage('push') {
		sh('git push origin master --tags')

		mail body: "syncthing bumped to ${latest}",
			subject: "syncthing bumped to ${latest}",
			to: 'sven@wltr.eu'
	}
}

def githubLatest(repo) {
	return sh(
		script: """curl -s \
			-H "Accept: application/vnd.github.v3+json" \
			"https://api.github.com/repos/${repo}/releases/latest" \
			| jq '.tag_name' -r""",
		returnStdout: true
	).trim()
}
