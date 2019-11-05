GITTER_PREFIX = 'GITTER'
##Variable to maintain the context##
CONTEXT = {}

module.exports = (robot) ->
    robot.hear /@bot (.*)/i, (res) ->
        ## Get the input from the user
        ques = res.match[1];
        ##fetching the gitter user id
        user_id = res.message.user.id
        user_name = res.message.user.name
        #username=res.message.user.id
        #console.log(res.message.user)
        #console.log("UserID", user_id)
        msg_time=new Date().toLocaleTimeString()
        
        ## check if some context exists
        if CONTEXT["#{GITTER_PREFIX}" +user_id]
            sol(res, robot, CONTEXT["#{GITTER_PREFIX}"+ user_id][ques], user_id, user_name, msg_time);
            return

        sol(res, robot, ques, user_id, user_name, msg_time);

##Function which will provide the solution on the basis os user's query  
sol = (res, robot, ques, user_id, user_name, msg_time)->
    robot.http("https://demo.securityknowledgeframework.org/api/chatbot/question","rejectUnauthorized": false)
          .header('Content-Type', 'application/json')
          .header('Accept', 'application/json')
          .post(JSON.stringify({"question": "#{ques}", "question_option": 0, "question_lang": "string"})) (err, response, body) ->
                ##If any error occured while fetching the data from api
                if err
                    res.send "Encountered an error :( #{err}"
                    return

                data = JSON.parse(body);
                result = []
                ##To add the data in the list
                for i of data.options
                    counter = data.options[i];
                    result.push "#{counter.answer}";
                ##if we have a single item in the list
                if result[0].length>80
                    delete CONTEXT["#{GITTER_PREFIX}"+ user_id];
                    res.send "@#{user_name} #{result} (#{msg_time}) ";
                ##multiple item in the list
                else if result[0]=="Please be more specific"
                    delete CONTEXT["#{GITTER_PREFIX}"+ user_id];
                    res.send "@#{user_name} #{result} (#{msg_time})";
                else
                    for i,value in result
                        ##setting up the context
                        CONTEXT["#{GITTER_PREFIX}" +user_id] = result
                        #console.log(CONTEXT["#{GITTER_PREFIX}" +user_id]);
                        res.send "@#{user_name} #{value}"+" "+"#{i}  (#{msg_time})";

