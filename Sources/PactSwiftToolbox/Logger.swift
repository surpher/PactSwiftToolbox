//
//  Created by Marko Justinek on 29/4/21.
//  Copyright © 2020 Marko Justinek. All rights reserved.
//
//  Permission to use, copy, modify, and/or distribute this software for any
//  purpose with or without fee is hereby granted, provided that the above
//  copyright notice and this permission notice appear in all copies.
//
//  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
//  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
//  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
//  SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
//  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
//  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR
//  IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
//

import Foundation
import os.log

public enum Logger {

	/// Uses `os_log` to log Pact related messages.
	///
	/// Looks for environment variable `PACT_ENABLE_LOGGING = "all"`. Can be set in project's scheme.
	///
	/// - Parameters:
	///    - message: The message to log
	///    - data: Data to log
	///
	public static func log(message: String, data: Data? = nil) {
		guard case .all = PactLoggingLevel(value: ProcessInfo.processInfo.environment["PACT_ENABLE_LOGGING"]) else {
			return
		}

		let stringData = data.flatMap { String(data: $0, encoding: .utf8) } ?? ""

		if #available(iOS 10, OSX 10.14, *) {
			os_log(
				"Pact: %{private}s",
				log: .default,
				type: .default,
				"\(message): \(stringData)"
			)
		} else {
			debugPrint("PactSwift: \(message)\n\(stringData)")
		}
	}

}

private extension Logger {

	enum PactLoggingLevel: String {
		case all
		case disabled

		init(value: String?) {
			switch value {
			case "all": self = .all
			default: self = .disabled
			}
		}
	}

}
