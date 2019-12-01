import 'package:Sufi_Circles/src/models/event/MetaData.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:flutter/material.dart';

class AddTargettedAudienceLimit extends StatefulWidget {
  AddTargettedAudienceLimit({Key key}) : super(key: key);

  @override
  _AddTargettedAudienceLimitState createState() =>
      _AddTargettedAudienceLimitState();
}

class _AddTargettedAudienceLimitState extends State<AddTargettedAudienceLimit> {
  AudienceLimit _audienceLimit = AudienceLimit.noLimit;
  LimitRange _limitRange = LimitRange.zeroTo50;

  setAudienceLimit(value) => this.setState(() => _audienceLimit = value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FormHeading(heading: "Describe your limit of audience?"),
          Row(
            children: <Widget>[
              Radio(
                value: AudienceLimit.noLimit,
                groupValue: _audienceLimit,
                onChanged: (AudienceLimit value) {
                  setState(() {
                    _audienceLimit = value;
                  });
                },
              ),
              FlatButton(
                onPressed: () =>
                    setState(() => _audienceLimit = AudienceLimit.noLimit),
                child: Text(
                  "No Limit.",
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Radio(
                value: AudienceLimit.limited,
                groupValue: _audienceLimit,
                onChanged: (AudienceLimit value) {
                  setState(() {
                    _audienceLimit = value;
                  });
                },
              ),
              FlatButton(
                onPressed: () =>
                    setState(() => _audienceLimit = AudienceLimit.limited),
                child: Text(
                  "Limited.",
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: _audienceLimit == AudienceLimit.limited
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Radio(
                            value: LimitRange.zeroTo50,
                            groupValue: _limitRange,
                            onChanged: (LimitRange value) {
                              setState(() {
                                _limitRange = value;
                              });
                            },
                          ),
                          FlatButton(
                            onPressed: () => setState(
                                () => _limitRange = LimitRange.zeroTo50),
                            child: Text(
                              "0 - 50",
                              style: Theme.of(context).textTheme.body2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: LimitRange.fiftyTo100,
                            groupValue: _limitRange,
                            onChanged: (LimitRange value) {
                              setState(() {
                                _limitRange = value;
                              });
                            },
                          ),
                          FlatButton(
                            onPressed: () => setState(
                                () => _limitRange = LimitRange.zeroTo50),
                            child: Text(
                              "50 - 100",
                              style: Theme.of(context).textTheme.body2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: LimitRange.hundredTo500,
                            groupValue: _limitRange,
                            onChanged: (LimitRange value) {
                              setState(() {
                                _limitRange = value;
                              });
                            },
                          ),
                          FlatButton(
                            onPressed: () => setState(
                                () => _limitRange = LimitRange.hundredTo500),
                            child: Text(
                              "100 - 500",
                              style: Theme.of(context).textTheme.body2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: LimitRange.fiveHundredTo1000,
                            groupValue: _limitRange,
                            onChanged: (LimitRange value) {
                              setState(() {
                                _limitRange = value;
                              });
                            },
                          ),
                          FlatButton(
                            onPressed: () => setState(() =>
                                _limitRange = LimitRange.fiveHundredTo1000),
                            child: Text(
                              "500 - 1K",
                              style: Theme.of(context).textTheme.body2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: LimitRange.thousandTo10000,
                            groupValue: _limitRange,
                            onChanged: (LimitRange value) {
                              setState(() {
                                _limitRange = value;
                              });
                            },
                          ),
                          FlatButton(
                            onPressed: () => setState(
                                () => _limitRange = LimitRange.thousandTo10000),
                            child: Text(
                              "1K - 10K",
                              style: Theme.of(context).textTheme.body2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: LimitRange.thousandTo10000,
                            groupValue: _limitRange,
                            onChanged: (LimitRange value) {
                              setState(() {
                                _limitRange = value;
                              });
                            },
                          ),
                          FlatButton(
                            onPressed: () => setState(
                                () => _limitRange = LimitRange.thousandTo10000),
                            child: Text(
                              "10K - 100K",
                              style: Theme.of(context).textTheme.body2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : null,
          )
        ],
      ),
    );
  }
}
