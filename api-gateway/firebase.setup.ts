import { Injectable, OnApplicationBootstrap } from '@nestjs/common';
import { readFile } from 'fs/promises';
import * as admin from 'firebase-admin';
let app: admin.app.App = null;
@Injectable()
export class FirebaseAdmin implements OnApplicationBootstrap {
	async onApplicationBootstrap() {
		if (!app) {
			app = admin.initializeApp({
				credential: admin.credential.cert({
					privateKey: process.env.FIREBASE_PRIVATE_KEY,
					clientEmail: process.env.FIREBASE_CLIENT_EMAIL,
					projectId: process.env.FIREBASE_PROJECT_ID,
				} as Partial<admin.ServiceAccount>),
				databaseURL: process.env.FIREBASE_PRIVATE_KEY,
			});
		}
	}
	setup() {
		return app;
	}
}

