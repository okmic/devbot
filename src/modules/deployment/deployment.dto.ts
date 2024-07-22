export interface ReqDeploymentDtoI {
    scripts: string[]
}
export interface ResDeploymentDtoI {
    scripts: string[]
}

export default class DeploymentDto {
    model: ResDeploymentDtoI

    constructor(payload: ReqDeploymentDtoI) {            
        this.model = {
            scripts: payload.scripts
        }
    }
}