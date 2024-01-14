/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

// TODO Marked For Deletion after RTK migration solidified
/* eslint-disable jsdoc/check-param-names */
/* eslint-disable @typescript-eslint/ban-ts-comment */
/* eslint-disable @typescript-eslint/no-unused-vars */
// @ts-nocheck
import ApiBackend from './ApiBackend';
import { PreferenceRequestItem } from '../../types/items';

export default class PreferencesApi {
	private readonly backend: ApiBackend;

	constructor(backend: ApiBackend) {
		this.backend = backend;
	}

	public async getPreferences(): Promise<PreferenceRequestItem> {
		return await this.backend.doGetRequest<PreferenceRequestItem>('/api/preferences');
	}

	public async submitPreferences(preferences: PreferenceRequestItem): Promise<PreferenceRequestItem> {
		return await this.backend.doPostRequest('/api/preferences', { preferences });
	}
}
