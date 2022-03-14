import * as React from "react";
import * as ReactDOM from "react-dom";
import consumer from "../channels/consumer";

// interface ChatProps {}

interface Message {
    content: string
    username: string
    user_id: number
}

function Chat() {
    const [messages, setMessages] = React.useState([]);


    React.useEffect(() => {
        const chatContainerScroll = document.getElementById("chatContainerScroll");
        chatContainerScroll.scrollTo(0, chatContainerScroll.scrollHeight);

        const subscription = consumer.subscriptions.create(
            { channel: "ChatChannel" },
            {
                received(data) {
                    setMessages([...messages, data.message]);
                    chatContainerScroll.scrollTo(0, chatContainerScroll.scrollHeight);
                },
            }
        );
        return function () {
            consumer.subscriptions.remove(subscription)
        }
    }, [messages, setMessages]);

    return (
        <div>
            {messages.map((message: Message, index: number) => {
                const messageCssClass = (window as any).current_user == message.user_id ? 'chat-right' : 'chat-left';

                return <li key={index} className={messageCssClass} >
                    <div className='chat-avatar'>
                        <img src="/images/avatar.jpg" alt="Retail Admin" />
                        <div className="chat-name">{message.username}</div>
                    </div>
                    <div className="chat-text">{message.content}</div>
                </li>
            })}
        </div>
    );
}

document.addEventListener("DOMContentLoaded", () => {
    console.log("sdaafs")
    const rootEl = document.getElementById("root");
    ReactDOM.render(<Chat />, rootEl);
});