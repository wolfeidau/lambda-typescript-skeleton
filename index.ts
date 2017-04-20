import { createLogger } from "bunyan";

const logger = createLogger({ name: "handler" });

export default function handler(event, context, callback) {
    logger.info({ event });

    callback();
}
