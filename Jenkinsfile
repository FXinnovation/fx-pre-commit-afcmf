import com.fxinnovation.data.ScmInfo

fxJob([
  pipeline: { ScmInfo scmInfo ->
    stage('build') {
      sh 'sh ./tests/run-tests.sh'
    }
  }
])
