import { handler } from "../index";

const event = {
    message: "Hello world!",
    operation: "echo",
};

describe("index", () => {

    describe("#handler", () => {
        it("should invoke callback", (cb) => {
            handler(event, {}, cb);
        });
    });
});
