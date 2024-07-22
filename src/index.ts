import express from 'express'
import cors from 'cors' 
import dotenv from "dotenv"
import authMiddleware from "./middleware/access.middleware"
import deploymentRoute from "./routers/deployment.route"
dotenv.config()

const app = express()

const PORT = process.env.PORT || 6969

app.use(express.json({limit: "100mb"}))
app.use(express.json())
app.use(cors({
	credentials: true,
	origin: [process.env.URL_CLIENT as string]
}))
app.use(authMiddleware)
app.use("/api", deploymentRoute)
app.use(function(req, res, next) {
	res.status(404).json({msg: '404 NOT FOUND'})
})

const start = async () => {
    try {
    	app.listen(PORT, () => console.log('Server started on port: ' + PORT))
    } catch (e) {
		console.log(e)
	}
}

start()