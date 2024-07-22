import {Request, Response, NextFunction} from "express"
import dotenv from "dotenv"
dotenv.config()

export default async function (req: Request, res: Response, next: NextFunction) {
    try {
        if(process.env.ACCESS_TOKEN === req.headers["access-token"]) return next()
        else return res.status(500).json({status: 401, errorCode: 0, errorMsg: "Not auth"}).end()
    } catch (e) {
        res.status(500).json({status: 401, errorCode: 0, errorMsg: "Not auth"}).end()
    }
}