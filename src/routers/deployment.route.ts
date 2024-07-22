import { Router } from 'express'
import deploymentController from '../modules/deployment/deployment.controller'


const router = Router()

router.post(
  '/execute-script',
  deploymentController.executeScript
)




export default router