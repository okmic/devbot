import { Request, Response, NextFunction} from "express"
import DeploymentDto from "./deployment.dto"
import deploymentService from "./deployment.service"

class DeploymentController {

    async executeScript(req: Request, res: Response, next: NextFunction) {
        try {
            if(!req.body.scripts || !Array.isArray(req.body.scripts) || req.body.scripts.length === 0) return res.status(400).json({status: 400, errorMessage: "invalid scripts", errorCode: 2}).end()
            const {model} = new DeploymentDto(req.body)

            const response = await deploymentService.executeScript(model)

            return res.status(200).json({status: 200, msg: "executed", result: response}).end()
        } catch (e) {
            console.log(e)
            return res.status(500).json({status: 500, errorMessage: "some error", errorCode: 1}).end()
        }
    }

}

export default new DeploymentController()