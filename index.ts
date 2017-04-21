import { createLogger } from "bunyan";

const logger = createLogger({ name: "handler" });

export function handler(event, context, callback) {
    logger.info({ event });

    callback();
}
