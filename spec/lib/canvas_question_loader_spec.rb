require 'canvas_question_loader'

RSpec.describe CanvasQuestionLoader do
  it "loads MC and TF questions from raw data" do
    json = %Q|[{
        "assessment_question_id": 19,
        "id": 21,
        "position": 1,
        "quiz_group_id": null,
        "quiz_id": 18,
        "question_name": "Question",
        "question_type": "multiple_answers_question",
        "question_text": "<p>What letter is first</p>",
        "points_possible": 1,
        "correct_comments": "",
        "incorrect_comments": "",
        "neutral_comments": "",
        "answers": [
            {  "id": "210",
                "text": "a",
                "comments": "",
                "weight": 100
            },
            {  "id": "1032",
                "text": "b",
                "comments": "",
                "weight": 0
            },
            {  "id": "4818",
                "text": "c",
                "comments": "",
                "weight": 0
            },
            {  "id": "28",
                "text": "",
                "comments": "",
                "weight": 0}],
        "variables": null,
        "formulas": null,
        "matches": null,
        "matching_answer_incorrect_matches": null
    },{
        "assessment_question_id": 91,
        "id": 101,
        "position": 1,
        "quiz_group_id": null,
        "quiz_id": 35,
        "question_name": "Question",
        "question_type": "true_false_question",
        "question_text": "<p>True or false?</p>",
        "points_possible": 1,
        "correct_comments": "",
        "incorrect_comments": "",
        "neutral_comments": "",
        "answers": [
          {  "comments": "",
              "text": "True",
              "weight": 100,
              "id": 3334
          },
          {  "comments": "",
              "text": "False",
              "weight": 0,
              "id": 3550
          }],
        "variables": null,
        "formulas": null,
        "matches": null,
        "matching_answer_incorrect_matches": null
      }
    ]|
    
    cql = CanvasQuestionLoader.new()
    cql.questions_hash = JSON.parse(json)
    cql.parse_questions_into_DB
    expect(Question.count).to equal(2)
    expect(Answer.count).to equal(6)
  end
end