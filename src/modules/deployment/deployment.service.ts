import { execSync } from "child_process"
import { ReqDeploymentDtoI } from "./deployment.dto"
import { writeFileSync} from "fs"
import {join} from "path"

class DeploymentService {

    private pathToSript = join(__dirname + "/scripts.sh")

    async executeScript(payload: ReqDeploymentDtoI) {
        try {
            return await new Promise((resolve, reject) => {
                let timer = 0
                const interval = setInterval(() => {
                    timer++
                    if (timer === 60) {
                        clearInterval(interval)
                        reject('Скрипт не был выполнен')
                    }
                }, 1000)

                const commands = payload.scripts
                const commandString = commands.join('\n')

                writeFileSync(this.pathToSript, commandString)

                try {
                    const result = execSync(`sh ${this.pathToSript}`).toString()
                    clearInterval(interval)
                    resolve(`Результат выполнения скрипта: ${result}`)

                } catch (e) {
                    clearInterval(interval)
                    reject('Error reload')
                }
            })
        } catch (e) {
            return 'Error reload'
        }
    }
}

export default new DeploymentService()