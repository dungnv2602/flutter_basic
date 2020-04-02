import 'package:flutter/material.dart';

class BottomSheetBasic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Modal Bottom Sheet'),
              onPressed: () async {
                await showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: new Wrap(
                          children: <Widget>[
                            new ListTile(
                                leading: new Icon(Icons.music_note), title: new Text('Music'), onTap: () => {}),
                            new ListTile(
                              leading: new Icon(Icons.videocam),
                              title: new Text('Video'),
                              onTap: () => {},
                            ),
                          ],
                        ),
                      );
                    });
              },
            ),
            RaisedButton(
              child: Text('Persistent Bottom Sheet'),
              onPressed: () {
                showBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: new Wrap(
                          children: <Widget>[
                            new ListTile(
                                leading: new Icon(Icons.music_note), title: new Text('Music'), onTap: () => {}),
                            new ListTile(
                              leading: new Icon(Icons.videocam),
                              title: new Text('Video'),
                              onTap: () => {},
                            ),
                          ],
                        ),
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}

class CustomizedBottomSheetSamples extends StatelessWidget {
  final title = 'Lorem Ipsum';
  final desc =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. no you condimentum finibus ut ut lorem. Ut pellentesque mauris ut arcu rutrum, at tincidunt arcu tincidunt ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('SUCCESS'),
              onPressed: () {
                CustomizedBottomSheet.success.show(context: context, title: title, desc: desc);
              },
            ),
            RaisedButton(
              child: Text('SUCCESS + ICON'),
              onPressed: () {
                CustomizedBottomSheet.success.show(context: context, title: title, desc: desc, icon: Icons.map);
              },
            ),
            RaisedButton(
              child: Text('SUCCESS + ICON + ACTIONS'),
              onPressed: () {
                CustomizedBottomSheet.success.show(
                  context: context,
                  title: title,
                  desc: desc,
                  icon: Icons.map,
                  actions: [
                    FlatButton(
                      child: Text(
                        'CONTINUE',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                );
              },
            ),
            RaisedButton(
              child: Text('NICE'),
              onPressed: () {
                CustomizedBottomSheet.nice.show(context: context, title: title, desc: desc);
              },
            ),
            RaisedButton(
              child: Text('NICE + ICON'),
              onPressed: () {
                CustomizedBottomSheet.nice.show(context: context, title: title, desc: desc, icon: Icons.opacity);
              },
            ),
            RaisedButton(
              child: Text('WARNING'),
              onPressed: () {
                CustomizedBottomSheet.warning.show(context: context, title: title, desc: desc);
              },
            ),
            RaisedButton(
              child: Text('WARNING + ICON'),
              onPressed: () {
                CustomizedBottomSheet.warning.show(context: context, title: title, desc: desc, icon: Icons.warning);
              },
            ),
            RaisedButton(
              child: Text('DANGER'),
              onPressed: () {
                CustomizedBottomSheet.danger.show(context: context, title: title, desc: desc);
              },
            ),
            RaisedButton(
              child: Text('DANGER + ICON'),
              onPressed: () {
                CustomizedBottomSheet.danger.show(context: context, title: title, desc: desc, icon: Icons.delete);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomizedBottomSheet {
  final Color contentRowColor;
  final Color buttonsRowColor;

  CustomizedBottomSheet({@required this.contentRowColor, @required this.buttonsRowColor});

  CustomizedBottomSheet._success()
      : contentRowColor = Color(0xff009688),
        buttonsRowColor = Color(0xff00695C);

  CustomizedBottomSheet._nice()
      : contentRowColor = Color(0xff2979FF),
        buttonsRowColor = Color(0xff0D47A1);

  CustomizedBottomSheet._warning()
      : contentRowColor = Color(0xffFF8C00),
        buttonsRowColor = Color(0xffF55932);

  CustomizedBottomSheet._danger()
      : contentRowColor = Color(0xffEF5350),
        buttonsRowColor = Color(0xffD32F2F);

  static final _successVar = CustomizedBottomSheet._success();
  static final _niceVar = CustomizedBottomSheet._nice();
  static final _warningVar = CustomizedBottomSheet._warning();
  static final _dangerVar = CustomizedBottomSheet._danger();

  static CustomizedBottomSheet get success => _successVar;

  static CustomizedBottomSheet get nice => _niceVar;

  static CustomizedBottomSheet get warning => _warningVar;

  static CustomizedBottomSheet get danger => _dangerVar;

  show({
    @required BuildContext context,
    @required String title,
    @required String desc,
    List<FlatButton> actions,
    IconData icon,
  }) {
    showModalBottomSheet(
        elevation: 8,
        useRootNavigator: true,
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Content Row
              Container(
                width: double.infinity,
                color: contentRowColor,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: Theme.of(context).primaryTextTheme.title.copyWith(fontSize: 28),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 16),
                    icon == null
                        ? Text(
                            desc,
                            style: Theme.of(context).primaryTextTheme.subtitle.copyWith(fontSize: 18),
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  desc,
                                  style: Theme.of(context).primaryTextTheme.subtitle.copyWith(fontSize: 18),
                                ),
                              ),
                              SizedBox(width: 16),
                              Icon(icon, color: Colors.white, size: 52),
                            ],
                          )
                  ],
                ),
              ),
              // Bottom Row
              actions == null
                  ? SizedBox.shrink()
                  : Container(
                      color: buttonsRowColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: actions,
                      ),
                    )
            ],
          );
        });
  }
}
